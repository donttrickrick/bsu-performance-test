# Before-Save Update Performance Test

This repo is used to test and evaluate  the  performance of process builder, trigger and before-save update.

## How to start

Pull the repo on your local machine, then run these commands with SFDX:

$ `sfdx force:org:create -f config/project-scratch-def.json --setalias bsu-performance-test --durationdays 1 --setdefaultusername --loglevel fatal`

$ `sfdx force:source:push --loglevel fatal --forceoverwrite`

Then run the test code /scripts/apex/performance-test.apex in developer console.

## Folder Structure

```
.
├── README.md
├── config
│   └── project-scratch-def.json
├── force-app
│   └── main
│       └── default
│           ├── flows
│           │   ├── Before_Save_Updates_When_Opportunity_Changed.flow-meta.xml
│           │   └── When_Opportunity_Updated.flow-meta.xml
│           ├── triggers
│           │   ├── OpportunityTrigger.trigger
│           │   └── OpportunityTrigger.trigger-meta.xml
│           └── workflows
│               └── Opportunity.workflow-meta.xml
├── package.json
├── scripts
│   └── apex
│       └── performance-test.apex
└── sfdx-project.json
```
