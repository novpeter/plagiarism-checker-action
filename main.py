import sys
from github import Github

ACCESS_TOKEN = sys.argv[1]
REPOSITORY_NAME = sys.argv[2]

if __name__ == '__main__':
    g = Github(ACCESS_TOKEN)
    repo = g.get_repo(REPOSITORY_NAME)
    pulls = repo.get_pulls(state='open', sort='created', base='master')
    for pr in pulls:
        info = f"user: {pr.user.name}, link: {pr.head.repo.clone_url}\n"
        print(info)