# Markdown-doc

Add tables of contents to all markdown files in this repo.

## Contents

* [Markdown-doc](#markdown-doc)
  * [Contents](#contents)
  * [Features](#features)
  * [Usage](#usage)
    * [Generate tables of contents](#generate-tables-of-contents)
    * [Bulk html generation](#bulk-html-generation)
  * [Author and Bug Reports](#author-and-bug-reports)
  * [Notes](#notes)

## Features

* Generate Tables of Contents
* bulk translate to HTML
* ...

## Usage

### Generate tables of contents
When run on a file with a section (any level) titled "Contents" (as above), the scripts here will enable you to automatically generate and insert a Table of Contents.

If no Contents section is found, the files will not be updated.

This also provides git hooks to update the ToC on commit (WARNING:  the way it does so will make `git add -p` pretty useless.  Feel free to modify the hook to better suit your needs if this 
one doesn't work for you.)

To (manually) update the table of contents for all markdown files in this directory, run

     make contents

(or just run `make`)

To set up the git hooks for this repository so that ToCs are updatted on commit, run.

     make hooks

### Bulk html generation

`make html`

all markdown files will be rendered into HTML using 'markdown' and placed in `generated/html`

## Author and Bug Reports

Please use GitHub issues for any bug reports or change requests

## Notes

The script uses `sed` and `awk` for maximum system compatability.  It was developed on MacOS, so it's expected to run anywhere with a `sed` and `awk` more recent than 1990 or so.

It's also about the gnarliest piece of `sed` that I ever want to write, and could be used as the example on a slide for "why modern interpreted languages exist".
