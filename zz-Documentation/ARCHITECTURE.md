
# Project Architecture
## Domain-Driven-Design Pattern
-------------------------------------------------
   * `Presentation`
   * `Application`
   * `Domain`
   * `Infrastructure`
   * `utility`
   * `config`
  
  ## Presentation-Layer
  -------------------------------------------------
   * `core` - {views, widgets}
   * `Feature` - {views, widgets}
  
  ## Application-Layer
  -------------------------------------------------
   * `core` - {bloc/cubit}
   * `Feature` - {bloc/cubit} 

  ## Domain-Layer
  -------------------------------------------------
   * `core` - {erros, value-object<T>, value-validators, value-failures}
   * `Feature` - {interface-facade/repository, entities, entity-failures}

  ## Infrastructure-Layer
  -------------------------------------------------
   * `core` - {its helper methods and classes}
   * `Feature` - {implementation-of-its-interface, error-mapper} 
 
  ## Utility-Layer
  -------------------------------------------------
   * `services` 
   * `dependency` injection
   * `helpers`
   * `router`

  ## Configuration-Layer
  -------------------------------------------------
   * {main-dev, main-prod}
   * {app_config}


