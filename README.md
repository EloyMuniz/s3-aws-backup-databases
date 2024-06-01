# S3 AWS Backup Databases

Este projeto consiste em uma rotina automatizada para fazer backup de um banco de dados PostgreSQL e enviá-lo para um bucket do Amazon S3 (Simple Storage Service).

# How to use

Certifique-se de ter o Node.js e uma Conta AWS com permissões de acesso ao S3. Clone o repositório:

$ git clone https://github.com/EloyMuniz/s3-aws-backup-databases

# Instalar dependências e iniciar servidor

$ yarn install

Para iniciar o servidor em modo de desenvolvimento e iniciar automaticamente sempre que houver alterações no código-fonte, use:

$ yarn dev

Para iniciar o servidor em um ambiente de produção, use:

$ yarn start

# Banco de Dados

Para gerar o schema do Prisma(ORM), execute:

$ npx prisma generate

Para migrar as tabelas do banco de dados, execute:

$ npx prisma migrate dev
