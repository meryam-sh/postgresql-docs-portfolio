# Docs-as-Code: A Beginner's GitHub Workflow

**Audience:** New technical writers collaborating with engineering teams.

## What docs-as-code means

A **docs-as-code** approach treats documentation as version-controlled text. Writers use Markdown, Git, branches, pull requests, reviews, and automated checks in a workflow similar to software development.

## Common terms

| Term | Meaning |
| --- | --- |
| Repository | Project containing files and their version history |
| Markdown | Plain-text formatting for headings, lists, links, and code |
| Commit | Saved snapshot of changes with a message |
| Branch | Independent line of work for a proposed change |
| Pull request | Proposal to review and merge changes into another branch |
| GitHub Actions | Automated jobs triggered by events such as pushes and pull requests |

## Suggested workflow

1. **Plan:** Define the reader, task, and success criteria.
2. **Branch:** Create a descriptive branch such as `docs/add-troubleshooting-steps`.
3. **Draft:** Edit Markdown with prerequisites, numbered steps, code blocks, and expected results.
4. **Validate:** Test commands in an isolated environment and check version-specific behavior.
5. **Review:** Open a pull request and request feedback from a subject-matter expert.
6. **Check:** Ensure automated documentation checks pass.
7. **Merge:** Merge only after required approvals and checks.

## Example Markdown

A heading is written as `# Title`, a link as `[label](destination)`, and a fenced command block as three backticks followed by a language such as `bash` or `sql`.

## Documentation review checklist

- [ ] The intended audience is clear.
- [ ] Prerequisites and supported versions are stated.
- [ ] Commands have been validated.
- [ ] Expected results and troubleshooting steps are included.
- [ ] Risky operations include appropriate warnings.
- [ ] Links and Markdown headings are correct.
- [ ] A subject-matter expert has reviewed technical claims.

## References

- [GitHub pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
- [Writing on GitHub](https://docs.github.com/en/get-started/writing-on-github)
