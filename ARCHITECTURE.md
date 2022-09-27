## GitHub Workflow
 * master
   - branches
     * Feature / UI
     * Feature / F()
     * Feature / UI-F()
       - subBranches
         * ../ {feat},{test},{fix},{refactor}

 * staging
   - branch
     * stagefix

 * production
   - branch
     * hotfix

## Project Architecture

 * lib 

   * presentation

     - core
       - start_app.dart
       - widgets

     - feature 1
       - ui controller
       - views
       - widgets
    
   * application

     - core

     - Feautre 1
       - <controller.dart>
       - <failure-handler.dart>

   * domain

     - core
       - <value_objects>
       - <value_validators>
       - <failures_validators>

     - Feautre 1
       - <value_object>
       - <entity>
       - <failure-entity-valueObjects>
       - <i-repository/facade>

   * infrastructure

       - core
       - <firebase_injectable_module>

     - Feautre 1
       - <exception-handler>
       - <failure-mapper>
       - <helper/mapper/extensions>
       - <firebase-repository/facade>

   * utils

    - bindings
    - constants
    - dependency-injection
    - router

   * config
   
    - <app-config>
    - flavor
      - <main-dev.dart>
      - <main-prod.dart>
    - firebase
      - dev
      - prod
