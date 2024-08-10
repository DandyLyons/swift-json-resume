This folder "JavaScript" is only kept in order to easily download the latest version of the JSON resume schema using node package manager. 
This package will attempt to update with each version of JSON resume so that we always have the latest version. However, if we are 
behind a version, you can go to https://github.com/jsonresume/resume-schema and download the latest version of the schema. 
Alternatively you can go into `swift-json-resume/Sources/SwiftyJSONResume/Resources/JavaScript/` and run `npm i` in the terminal. This will install the latest update of the JSONResume schema which you can find in the `schema.json` file.

Note the `node_modules` directory is not tracked by git, and is 
only here to make it easier update. 
