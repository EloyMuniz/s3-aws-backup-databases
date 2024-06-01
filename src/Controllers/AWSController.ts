import { PutObjectCommand, S3Client } from "@aws-sdk/client-s3";
import { Upload } from "@aws-sdk/lib-storage";
import { Request, Response } from "express"
import { exec } from "child_process"
import { Pool } from "pg"
import { Readable } from "stream"
import cron from "node-cron"
import fs from "fs"
import dotenv from 'dotenv';
dotenv.config();
//Chaves de acesso do meu AWS S3
const accessKeyId = process.env.AWS_ACCESS_KEY_ID
const secretAccessKey = process.env.AWS_SECRET_ACCESS_KEY;
//Variável de ambiente da senha do banco PostgreSQL
process.env.PGPASSWORD;
//Instancia o Cliente do aws-sdk
const client = new S3Client({
    credentials: {
        accessKeyId: `${accessKeyId}`,
        secretAccessKey: `${secretAccessKey}`
    },
    region: "us-east-1",
})

const bucketName = "eloy-my-uploads";

const dumpFileName = 'dump.sql';
const dumpCommand = ` pg_dump -U postgres -h localhost -d aws_s3 -F c -b -v -w -f ${dumpFileName}`;


class AWSController {
    public async sendDataBase(req?: Request, res?: Response) {
        try {
            //Cria o dump do banco PostgreSQL
            exec(dumpCommand, (error, stdout, stderr) => {
                if (error) {
                    console.error(`Erro ao realizar o dump: ${error.message}`);
                    return;
                }

                if (stderr) {
                    console.error(`Stderr: ${stderr}`);
                    return;
                }
                console.log(`Dump realizado com sucesso! Arquivo: ${dumpFileName}`);
                return
            });
            // Carregue o arquivo de dump no buffer
            const fileBuffer = fs.readFileSync('./dump.sql');

            // Crie um stream de leitura a partir do buffer
            const fileStream = Readable.from(fileBuffer);
            //Faz o upload para o bucket na AWS-S3
            const upload = new Upload({
                client: client,
                params: {
                    Bucket: bucketName,
                    Key: "dump.sql",
                    Body: fileStream,
                },
            });
            const response = await upload.done();
            if (response) {
                return res?.status(200).json({ message: "O arquivo foi enviado com sucesso!" })
            }

            return res?.status(400).json({ message: "Não foi possível enviar o arquivo!" })

        } catch (error) {
            return res?.status(400).json({ message: `Não foi possível registrar seus dados! ${error}` })
        }
    }
    public awsRoutine() {

        cron.schedule('*/2 * * * *', async () => {
            try {
                await this.sendDataBase()
                console.log('running a task every minute');
            } catch (error) {

                console.error("Erro durante a verificação de alertas:", error);

            }
        });

    }



}
const userController = new AWSController()
userController.awsRoutine()
export default new AWSController()