# mapedit 0.2.1

* add editFeatures function for easy add, edit, delete with existing simple features (sf)
* add record argument to edit* functions to preserve the series
of actions from an editing session.  If `record = TRUE` then a `"recorder"` attribute will be added to the returned object for
full reproducibility.
* add viewer argument to select and edit functions to allow
user the flexibility to adjust the viewer experience.  Default
will be paneViewer() in an attempt to keep the workflow
within one RStudio window/context.
* change height to 97% to fill viewer
* document more thoroughly
* pass trial CRAN check

# mapedit 0.2.0

* add Shiny module functionality
* add selectFeatures function for easy selection of features from simple features (sf)
* defaults to repeat mode in editMap()
* removes circle Leaflet.draw tool by default in editMap()
* use layerId instead of group for select
* uses Viewer window for selectMap()
* promote mapview to Imports
* uses newly exported mapview::addFeatures()


# mapedit 0.1.0

**API breaking change**

* camelCase `editMap` and `selectMap`

# mapedit 0.0.2

* add dependency on `dplyr`
* add dependency on `sf`
* `edit_map()` now returns `sf` instead of `geojson` by default.  Toggle
    behavior with the `sf` argument.

# mapedit 0.0.1

* first release with proof-of-concept functionality