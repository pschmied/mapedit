#' Interactively Select Map Features
#'
#' @param x features to select
#' @param ... other arguments
#'
#' @example ./inst/examples/examples_select.R
#' @export
selectFeatures = function(x, ...) {
  UseMethod("selectFeatures")
}


#' @name selectFeatures
#' @param map a background \code{leaflet} or \code{mapview} map
#'          to be used for editing. If \code{NULL} a blank
#'          mapview canvas will be provided.
#' @param index \code{logical} with \code{index=TRUE} indicating return
#'          the index of selected features rather than the actual
#'          selected features
#' @param viewer \code{function} for the viewer.  See Shiny \code{\link[shiny]{viewer}}.
#' @export
selectFeatures.sf = function(
  x = NULL,
  map = NULL,
  index = FALSE,
  viewer = shiny::paneViewer(),
  ...
) {

  x = mapview:::checkAdjustProjection(x)
  x$edit_id = as.character(1:nrow(x))

  if (is.null(map)) {
    map = mapview::mapview()@map
    map = mapview::addFeatures(map, data=x, layerId=~x$edit_id)
    ext = mapview:::createExtent(x)
    map = leaflet::fitBounds(
      map,
      lng1 = ext[1],
      lat1 = ext[3],
      lng2 = ext[2],
      lat2 = ext[4]
    )
    map = mapview::addHomeButton(map = map, ext = ext)
  } else {
    if(inherits(map, "mapview")) {
      map = map@map
    }
    map = mapview::addFeatures(map, data=x, layerId=~x$edit_id)
  }

  ind = selectMap(map, viewer=viewer, ...)

  indx = ind$id[as.logical(ind$selected)]
  # todrop = "edit_id"

  # when index argument is TRUE return index rather than actual features
  if(index) {
    return(as.numeric(indx))
  }

  # return selected features
  return(x[as.numeric(indx), !names(x) %in% "edit_id"])
}

#' @name selectFeatures
#' @export
selectFeatures.Spatial = function(x, ...) {
  selectFeatures(x=sf::st_as_sf(x), ...)
}
