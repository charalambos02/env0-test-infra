This PR adds a new S3 bucket resource. While the change itself is straightforward, 
we should manually review S3 bucket creations for:

1. Bucket naming conventions (ensure it follows our standards)
2. Additional recommended configurations (versioning, encryption, logging)
3. Any required bucket policies or access controls

Suggested next steps:
1. Verify the bucket name is appropriate and available
2. Consider adding basic configurations like:
   - Versioning to protect against accidental deletions
   - Server-side encryption
   - Any required tags