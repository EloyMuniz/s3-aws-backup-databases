import AWSController from "../src/Controllers/AWSController";
import { Router } from "express"
const awsRouter = Router()

awsRouter.get("/awssenddb", AWSController.sendDataBase)
export default awsRouter