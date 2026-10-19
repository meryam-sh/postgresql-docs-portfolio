# Linux and PostgreSQL: A First Troubleshooting Checklist

**Audience:** Support engineers or technical writers gathering information about a PostgreSQL connectivity issue.  
**Environment:** Linux host with authorized shell access; commands depend on distribution and installation method.  
**Status:** Documentation sample; not tested against a production Linux host.

## Before you begin

Confirm whether PostgreSQL is self-managed on Linux or hosted by a managed provider such as Neon. On a managed database, you generally cannot inspect or restart the underlying Linux service yourself.

Never paste passwords, connection strings, or unredacted customer data into a public issue, screenshot, or repository.

## Step 1: Identify the host

```bash
pwd
ls -la
uname -a
```

- `pwd` prints the current directory.
- `ls -la` lists files, including hidden files.
- `uname -a` shows operating-system kernel information.

## Step 2: Check the installed client version

```bash
psql --version
```

This reports the version of the installed **psql client**, which may differ from the PostgreSQL **server** version.

## Step 3: Test database connectivity

If your environment already has an approved `DATABASE_URL` variable:

```bash
psql "$DATABASE_URL" -c "SELECT current_database(), version();"
```

If it fails, capture the exact error message after removing secrets. Common causes include incorrect host or port, invalid credentials, network restrictions, or server availability.

## Step 4: Check a local systemd service, if applicable

```bash
systemctl status postgresql
```

This only applies to an appropriately configured **self-managed** Linux installation using systemd. Service names vary by distribution and installation method. Do not restart a service without authorization.

## Step 5: Prepare an escalation note

Record the PostgreSQL version, host environment, exact redacted error, expected result, actual result, steps to reproduce, and checks already performed.

## References

- [psql reference](https://www.postgresql.org/docs/17/app-psql.html)
- [PostgreSQL server setup](https://www.postgresql.org/docs/17/runtime.html)
