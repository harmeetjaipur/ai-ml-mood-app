/*
  Warnings:

  - You are about to drop the column `postId` on the `analysis` table. All the data in the column will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[journalId]` on the table `Analysis` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `journalId` to the `Analysis` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Analysis_postId_key` ON `analysis`;

-- AlterTable
ALTER TABLE `analysis` DROP COLUMN `postId`,
    ADD COLUMN `journalId` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `post`;

-- CreateTable
CREATE TABLE `Journal` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `content` TEXT NOT NULL,
    `geoLocation` VARCHAR(191) NULL,
    `tags` JSON NULL,

    INDEX `Journal_userId_idx`(`userId`),
    INDEX `Journal_createdAt_idx`(`createdAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Analysis_journalId_key` ON `Analysis`(`journalId`);
