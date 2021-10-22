#!/bin/bash

for repo in leaner-procurement-server leaner-procurement-client leaner-procurement-admin leaner-procurement-supplier
do
  cd ~/src/github.com/leaner-co-jp/$repo
  PULL_REQUESTS=`gh pr list -l 'レビュー待ち'`
  PULL_REQUEST_NUMBER_LIST=`echo "$PULL_REQUESTS" | awk '{ print $1 }'`
  for pull_request_number in $PULL_REQUEST_NUMBER_LIST
  do
    gh pr view $pull_request_number --web
  done
done
