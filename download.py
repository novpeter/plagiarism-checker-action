import sys

from github import Github
from git import Repo

ACCESS_TOKEN = sys.argv[1]
REPOSITORY_NAME = sys.argv[2]

# GitHub client
github_client = Github(ACCESS_TOKEN)

# Project repository
repo = github_client.get_repo(REPOSITORY_NAME)


def download_pulls():
    """
    Downloads pull requests in solutions folder. After execution all
    solutions will contain only .swift files
    """
    pulls = repo.get_pulls(state='open', sort='created', base='master')
    for pr in pulls:
        author = pr.user.name
        clone_url = pr.head.repo.clone_url
        directory = f"./solutions/{author}"
        Repo.clone_from(clone_url, directory)


if __name__ == '__main__':
    download_pulls()
