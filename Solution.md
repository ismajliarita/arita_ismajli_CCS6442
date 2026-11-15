# Solutions for Part 1

This file will explain the issues that have risen during part 1 of the assignment, the resolution which was done and the possible ways it could have been done better.

## 1. Requirement 6: Dead end and conflict resolution

Initially, we deliberately created a situation where there would be issues with merging due to changes in the same line in the file `user.py` in remote and local develop branch.

This created a dead end.

The exact steps are:

- I attempted to push my commits to the remote develop branch, but Git rejected it since the remote had changes which were not present locally.

- Therefore, I continued and tried to pull the remote changes, which resulted in a mrege conflict in `user.py`.

- I opened the conflict in VSCode, resolved the conflict manually by preserving both changes, then continuing to stage and commit, amd completing the merge.

This taught me that using `git status` could have saved me some trouble. I would have still needed to manually review the conflict, however I would have been more prepared and aware of what was happening with my repo and the changes between remote and local.

This can especially happen once I am working on a repo with other teammates, since this scenario emulates how it would have looked like if someone pushed changes before me.

If the changes in the remote environment happened before development, then this could have all been avoided by pulling the changes made, and then making the changes of my own.

## 2. Requirement 19: Pull Request review

This requirement has been a challenge due to mistakes made in the beginning, which eventually.

The exact steps are:

- The `feature/step-4` branch (of the PR) was created from the develop branch.

- Changes were made in `feature/step-4`

- PR created for review -> branch to develop

The problem was that the changes made in `feature/step-4` were depended on the changes presented in `feature/step-1`, therefore the changes of `feature/step-4` should not be integrated independently from `feature/step-1`.

I left a comment in this PR with information and recommandation regading the fix, or a better practice.

The PR was closed, and the recommandation showed: Please make sure that the parent branch is merged and integrated if changes from that branch are needed, then after that pull changes from develop and then continue development in your branch.

After that I closed this PR, deleted the branch, and unfortunately I did not follow my own suggestions since they were way too idealistic (a.k.a. I could not merge `feature/step-1`, so I improvised).

In practice, I followed these steps:

- I deleted the branch `feature/step-4`

- I created the same branch once more from `feature/step-1` so the new branch `feature/step-4` can have the changes it needs.

- Made changes and created PR to develop.

Now this can create an issue which I am now aware of and learned when both branches try to get merged to develop, `feature/step-4` will already have the un-reviewed changes of `feature/step-1` if this branch does not get reviewed and merged. If `feature/step-1` has comments or other changes, then we will not have the updated changes to `feature/step-4`.

## 3. Requirement 21: Release version 1

To send a project to the client, this requirement will be about making the code ready for client use.

Steps:

- Created release/1.0.0 from develop. The reason the release was initiated from develop is because develop contains the latest changes made and all features we want to push to the client, and the master branch represents the code that is currently being used by the client (Production)
  - This also makes sure that new features and development can continue in develop without issue since release preparations were kept separate (release related changes and testing are separate)

- Created Git tag v1.0.0: This identifies the exact commit that created the release. v stands for version, and based on standardization, we can see that this is the 1st stable, official release of the project, the first 0 tells that there were no minor release about changes of backward-compatibility functionality, and the last 0 tells us there have not been any hot-fixes or bugs yet for this version.

- Merged release/1.0.0 into master, making it the production version

- Merged back into develop: Made sure that any changes made during release preparations were also in develop branch

## 4. Requirement 22: New feature after release

To create a new feature after the release, now it is made simple. The purpose of the new feature was to create a method to be able to make User objects as readable strings.

The fact that I merged master back to develop, gives us a clean slate to work with.

Steps:

- Created branch `feature/user-string-method` to develop the new feature

- Paused feature development due to need for hotfix in production (requirement 23)

- Stashed changes temporarily, so I could work separately on a hotfix branch

Hotfix:

- Created hotfix branch from master branch (so it wouldn't have any other changes pushed to production)

- Fixed the production bug

- Merged the hotfix to master, then to develop so the change would not appear again later

- I returned to develop, synced the changes from remote, and applied stashed changes to continue development of the new feature
