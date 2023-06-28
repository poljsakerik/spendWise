-- CreateTable
CREATE TABLE `Example` (
    `id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Account` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `provider` VARCHAR(191) NOT NULL,
    `providerAccountId` VARCHAR(191) NOT NULL,
    `refresh_token` TEXT NULL,
    `access_token` TEXT NULL,
    `expires_at` INTEGER NULL,
    `token_type` VARCHAR(191) NULL,
    `scope` VARCHAR(191) NULL,
    `id_token` TEXT NULL,
    `session_state` VARCHAR(191) NULL,

    UNIQUE INDEX `Account_provider_providerAccountId_key`(`provider`, `providerAccountId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Session` (
    `id` VARCHAR(191) NOT NULL,
    `sessionToken` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `expires` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Session_sessionToken_key`(`sessionToken`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `emailVerified` DATETIME(3) NULL,
    `image` VARCHAR(191) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `VerificationToken` (
    `identifier` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `expires` DATETIME(3) NOT NULL,

    UNIQUE INDEX `VerificationToken_token_key`(`token`),
    UNIQUE INDEX `VerificationToken_identifier_token_key`(`identifier`, `token`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transaction` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `account` VARCHAR(191) NOT NULL,
    `externalId` VARCHAR(191) NULL,
    `balance` INTEGER NULL,
    `amount` INTEGER NOT NULL,
    `creditAmount` INTEGER NULL,
    `currency` INTEGER NOT NULL,
    `valueDate` DATETIME(3) NULL,
    `postingDate` DATETIME(3) NOT NULL,
    `description` VARCHAR(191) NULL,
    `purposeCode` ENUM('ACCT', 'ADMG', 'ADVA', 'AEMP', 'AGRT', 'AIRB', 'ALMY', 'ANNI', 'ANTS', 'AREN', 'BECH', 'BENE', 'BEXP', 'BLDM', 'BOCE', 'BONU', 'BUSB', 'CASH', 'CBFF', 'CBTV', 'CCHD', 'CCRD', 'CDBL', 'CDCB', 'CDCD', 'CDCS', 'CDOC', 'CDQC', 'CFEE', 'CHAR', 'CLPR', 'CMDT', 'COLL', 'COMC', 'COMM', 'COMT', 'COST', 'CPYR', 'CSDB', 'CSLP', 'CVCF', 'DBTC', 'DCRD', 'DEPT', 'DERI', 'DIVD', 'DMEQ', 'DNTS', 'ECPG', 'ECPR', 'ECPU', 'ELEC', 'ENRG', 'ESTX', 'ETUP', 'FAND', 'FERB', 'FREX', 'GASB', 'GDDS', 'GDSV', 'GFRP', 'GOVI', 'GOVT', 'GSCB', 'GVEA', 'GVEB', 'GVEC', 'GVED', 'HEDG', 'HLRP', 'HLTC', 'HLTI', 'HREC', 'HSPC', 'HSTX', 'ICCP', 'ICRF', 'IDCP', 'IHRP', 'INPC', 'INSM', 'INSU', 'INTC', 'INTE', 'INTX', 'LBRI', 'LICF', 'LIFI', 'LIMA', 'LOAN', 'LOAR', 'LTCF', 'MDCS', 'MSVC', 'NETT', 'NITX', 'NOWS', 'NWCH', 'NWCM', 'OFEE', 'OTHR', 'OTLC', 'PADD', 'PAYR', 'PENS', 'PHON', 'POPE', 'PPTI', 'PRCP', 'PRME', 'PTSP', 'RCKE', 'RCPT', 'REFU', 'RENT', 'RINP', 'RLWY', 'ROYA', 'SALA', 'SAVG', 'SCVE', 'SECU', 'SLPI', 'SSBE', 'STDY', 'SUBS', 'SUPP', 'TAXS', 'TELI', 'TRAD', 'TREA', 'TRFD', 'TRNC', 'VATX', 'VIEW', 'WEBI', 'WTER') NULL,
    `status` VARCHAR(191) NULL,
    `direction` ENUM('INCOMING', 'OUTGOING') NULL,
    `creditorAccount` VARCHAR(191) NULL,
    `debtorAccount` VARCHAR(191) NULL,
    `participantAccount` VARCHAR(191) NULL,
    `creditorCity` VARCHAR(191) NULL,
    `debtorReference` VARCHAR(191) NULL,
    `participantName` VARCHAR(191) NULL,
    `creditorName` VARCHAR(191) NULL,
    `debtorName` VARCHAR(191) NULL,
    `creditorAddress` VARCHAR(191) NULL,
    `debtorAddress` VARCHAR(191) NULL,
    `participantAddress` VARCHAR(191) NULL,
    `creditorCountryCode` VARCHAR(191) NULL,
    `transactionCode` INTEGER NULL,
    `paymentTransactionId` VARCHAR(191) NULL,
    `statementNumber` INTEGER NULL,
    `type` ENUM('BANK_INTEREST', 'DINE_OUT', 'PAYCHECK', 'GROCERIES', 'NIGHT_OUT', 'OUTGOING_DEPOSIT', 'INTERNAL_TRANSFER', 'INCOMING_DEPOSIT', 'UTILITIES', 'CLOTHING', 'PERSONAL_GOODS', 'CASH_DEPOSIT', 'CASH_WITHDRAWAL', 'CAR_MAINTENANCE', 'MEDICINE', 'UNKNOWN', 'HOME_IMPORVEMENT', 'WELLNES', 'SCHOLARSHIP', 'RIDE_HAILING', 'HAIR_CUT', 'GIFT', 'VACATION') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TrainTransaction` (
    `transcationId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`transcationId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Account` ADD CONSTRAINT `Account_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Session` ADD CONSTRAINT `Session_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TrainTransaction` ADD CONSTRAINT `TrainTransaction_transcationId_fkey` FOREIGN KEY (`transcationId`) REFERENCES `Transaction`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
