/*
  Warnings:

  - You are about to drop the column `confidenceLevel` on the `analysis` table. All the data in the column will be lost.
  - You are about to drop the column `journalId` on the `analysis` table. All the data in the column will be lost.
  - You are about to drop the column `modelVersion` on the `analysis` table. All the data in the column will be lost.
  - You are about to drop the column `suggestedActions` on the `analysis` table. All the data in the column will be lost.
  - You are about to drop the column `geoLocation` on the `journalentry` table. All the data in the column will be lost.
  - You are about to drop the column `tags` on the `journalentry` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[entryId]` on the table `Analysis` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `entryId` to the `Analysis` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Analysis_journalId_key` ON `analysis`;

-- DropIndex
DROP INDEX `JournalEntry_createdAt_idx` ON `journalentry`;

-- AlterTable
ALTER TABLE `analysis` DROP COLUMN `confidenceLevel`,
    DROP COLUMN `journalId`,
    DROP COLUMN `modelVersion`,
    DROP COLUMN `suggestedActions`,
    ADD COLUMN `entryId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `journalentry` DROP COLUMN `geoLocation`,
    DROP COLUMN `tags`;

-- CreateIndex
CREATE UNIQUE INDEX `Analysis_entryId_key` ON `Analysis`(`entryId`);
