import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";


export async function POST({request}){
    const body = await request.json();
   const prisma = new PrismaClient();
const hash = await bcrypt.hashSync(body.pass);
const res = await prisma.user.create({
    data: {
        email: body.email,
        name: body.name,
        hashPass: hash
    }
})

    return new Response("Created",{status:201})
}