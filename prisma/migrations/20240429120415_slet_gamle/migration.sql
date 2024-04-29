/*
  Warnings:

  - You are about to drop the `Energi` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Energi" DROP CONSTRAINT "Energi_authorId_fkey";

-- DropTable
DROP TABLE "Energi";

-- CreateTable
CREATE TABLE "Energi1" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "authorId" TEXT NOT NULL,

    CONSTRAINT "Energi1_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Energi1" ADD CONSTRAINT "Energi1_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
