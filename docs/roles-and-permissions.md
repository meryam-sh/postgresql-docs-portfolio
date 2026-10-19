# PostgreSQL Roles and Permissions

**Audience:** A beginner documenting access-control concepts.  
**Status:** Conceptual sample; administrator privileges may be required to run the examples.

## Authentication and authorization

**Authentication** verifies who is connecting. **Authorization** determines what an authenticated role is allowed to do. PostgreSQL uses **roles** for both database identities and groups of privileges.

A role with the `LOGIN` attribute can connect as a database user. Privileges may be granted on databases, schemas, tables, and other objects.

## Example: A read-only reporting role

The following commands illustrate the grants needed for a role to read existing tables in the `public` schema of a practice database named `neondb`.

```sql
CREATE ROLE reporting_reader LOGIN;
GRANT CONNECT ON DATABASE neondb TO reporting_reader;
GRANT USAGE ON SCHEMA public TO reporting_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO reporting_reader;
```

These grants do **not** automatically cover tables created in the future. Future-table access may require `ALTER DEFAULT PRIVILEGES` configured for the role that creates those tables.

No password is included in this public example. For a real login, use an approved, secure credential-management process; never commit database passwords or connection strings to GitHub.

## Revoke a privilege

```sql
REVOKE SELECT ON ALL TABLES IN SCHEMA public FROM reporting_reader;
```

This removes the explicit `SELECT` grant on existing tables in the schema, but effective privileges may also come from other roles or grants.

## Least privilege

Grant only what is needed. A reporting role generally should not have `INSERT`, `UPDATE`, `DELETE`, schema ownership, or administrative privileges.

## Troubleshooting access errors

1. Check the database and role names.
2. Confirm the role has `LOGIN` and can authenticate.
3. Check `CONNECT` on the database and `USAGE` on the schema.
4. Check privileges on the specific table.
5. Consider inherited role membership and default privileges for newly created objects.

## References

- [Database roles](https://www.postgresql.org/docs/17/user-manag.html)
- [Privileges](https://www.postgresql.org/docs/17/ddl-priv.html)
- [GRANT](https://www.postgresql.org/docs/17/sql-grant.html)
