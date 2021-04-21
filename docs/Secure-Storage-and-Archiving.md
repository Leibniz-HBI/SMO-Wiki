# Secure Storage and Archiving

We recommend encrypted storage for all remotely stored data. If possible, for security, sustainability, and accessibility reasons, we recommend to use encryption software that is

* open source,
* independently audited,
* free to use for non-commercial purposes.

## Encrypted File Synchronisation

### Cryptomator

[Cryptomator](https://cryptomator.org/) is a tool which enables seamless encryption of data on cloud sharing platforms such as Nextcloud, Dropbox, OneDrive, Google Drive, etc.

### Keybase

[Keybase](https://keybase.io) is an end-to-end encrypted team-chat client that additionally offers 250 GB of end-to-end encrypted storage.

## Encrypted (Remote) Backups

Please be aware that live-backups of database systems are a tricky issue. Usually the backups get corrupted when backing up a running database. Either backup regular dumps of the database or refer to the documentation of the respective database whether and how live-backups are possible.

### POSIX (Linux, MacOS)

#### Borg Backup / Vorta

[Borg](https://borgbackup.readthedocs.io/en/stable/index.html) is a command line tool for POSIX systems to create automated, recurring, deduplicated/incremental, compressed and encrypted (remote) backups of selected folders (contrasting to full disk backups).

[Vorta](https://vorta.borgbase.com/) is a GUI client for borg.

Both can backup to local or remote storage.

### Windows

#### Duplicati

As Borg/Vorta cannot natively run on Windows systems, we would recommend to use [Duplicati](https://www.duplicati.com/) which offers the same functionality. It is also installable on POSIX systems, however it requires to install the mono framework beforehand (a .NET port for POSIX systems).