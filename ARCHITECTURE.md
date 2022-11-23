
## Project Architecture
# Domain-Driven-Design Pattern
 
  `Layered-Overview `
   * Presentation
   * Application
   * Domain
   * Infrastructure
   * utility
   * config
  
  - `Presentation-Layer`
   * core - {views, widgets}
   * segment's - {views, sub-segment, widgets}
  
  - `Application-Layer`
   * core - {controllers}
   * segment's - {controllers} 

  - `Domain-Layer`
   * core - {erros, value-object<T>, value-validators, value-failures}
   * segment's - {interface-facade/repository, entities, entity-failures}

  - `Infrastructure-Layer`
   * core - {its helper methods and classes}
   * segment's - {implementation-of-its-interface} 
 
  - `Utility-Layer`
   * bindings - {helper methods and classes}
   * constants - {implementation-of-its-interface} 
   * dependency injection
   * helpers - {functions/classes Global}
   * router

  - `Configuration-Layer`
   * flavor - {main-dev, main-prod}
   * database - {dev, prod} 


