DEFAULT_NAME="$(git config user.name)"
DEFAULT_EMAIL="$(git config user.email)"
export OLD_NAME="${1:-$DEFAULT_NAME}"
export NEW_NAME="${2:-$DEFAULT_NAME}"
export NEW_EMAIL="${3:-$DEFAULT_EMAIL}"

echo "Old:" $OLD_NAME "<*>"
echo "New:" "$NEW_NAME <$NEW_EMAIL>"
echo "To undo, use: git reset $(git rev-parse HEAD)"

git filter-branch --env-filter \
'if [ "$GIT_AUTHOR_NAME" = "${OLD_NAME}" ]; then
	export GIT_AUTHOR_NAME="${NEW_NAME}"
	export GIT_AUTHOR_EMAIL="${NEW_EMAIL}"
	export GIT_COMMITTER_NAME="${NEW_NAME}"
	export GIT_COMMITTER_EMAIL="${NEW_EMAIL}"
fi'