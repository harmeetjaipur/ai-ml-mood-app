/*
  Warnings:

  - You are about to drop the `journal` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `journal`;

-- CreateTable
CREATE TABLE `JournalEntry` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `content` TEXT NOT NULL,
    `geoLocation` VARCHAR(191) NULL,
    `tags` JSON NULL,

    INDEX `JournalEntry_userId_idx`(`userId`),
    INDEX `JournalEntry_createdAt_idx`(`createdAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
