git submodule update --init --remote # update Wiki-submodule (TODO: make optional)
cp docs/_config.yml ./ # back up _config.yml for Github pages
cp docs/Gemfile* ./ # back up  for Github pages
cp -r docs/_layouts ./ # back up website layout
cp -r docs/assets ./ # back up CSS
cp -r docs/images ./
cp docs/CNAME ./
cp docs/google*.html ./
rm -rf docs # delete old files
cp -r Social-Media-Observatory.wiki ./docs # write new files from Wiki-submodule
mv _config.yml docs/ # move back backuped files
mv Gemfile* docs/ # move back backuped files
mv _layouts docs/ # move back backuped files
mv assets docs/ # move back backuped files
mv images/* docs/images/
rm -r images
mv CNAME docs/
mv google*.html docs/
rm docs/.git # remove repository files from docs folder so that it is not recognised as another submodule
mv docs/Home.md docs/index.md # rename, so that Jekyll uses it as homepage
python3 convert_links.py # convert [[wiki links]] to [wiki links](wiki-links)
python3 generate_titles_from_filename.py # use the file-name to add # file name as title to md files
cd Social-Media-Observatory.wiki
echo -e "# 👏💫🏆 Wall of Fame 🏆💫👏\n" > ../docs/Wall-of-Fame.md
echo -e "## Authors by number of commits (edits)\n\n\`\`\`" >> ../docs/Wall-of-Fame.md
git shortlog -sn >> ../docs/Wall-of-Fame.md
echo -e "\`\`\`\n\n## Authors by number of lines\n\n\`\`\`" >> ../docs/Wall-of-Fame.md
git ls-files | while read f; do git blame -w -M -C -C --line-porcelain "$f" | grep -I '^author '; done | sort -f | uniq -ic | sort -n --reverse >> ../docs/Wall-of-Fame.md
echo -e "\`\`\`" >> ../docs/Wall-of-Fame.md
cd ..
echo -e "\n## Commits to the pretty wiki codebase\n\n\`\`\`" >> docs/Wall-of-Fame.md
git shortlog -sn >> docs/Wall-of-Fame.md
echo -e "\`\`\`" >> docs/Wall-of-Fame.md
git add -A # add updates
# git commit -a -m "updating markdowns" # commit updates
# git push # push updates
