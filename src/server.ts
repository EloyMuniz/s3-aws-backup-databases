import express from "express"
import awsRouter from "../routes/aws"
import { toZonedTime,formatInTimeZone, format } from "date-fns-tz"
const app = express()
const PORT = 8080

const data = new Date()
const timezone = "America/Sao_Paulo"
const dateString = formatInTimeZone(data, timezone,"yyyy-MM-dd HH:mm:ss")
app.use(express.json());
app.use(awsRouter)
app.listen(PORT, () => {
    console.log(`O servidor está rodando na porta: ${PORT}`)
    console.log(dateString)
})