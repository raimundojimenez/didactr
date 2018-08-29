% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gs_slide_df.R
\name{gs_slide_df}
\alias{gs_slide_df}
\alias{notes_from_slide}
\title{Get Google Slide Elements IDs}
\usage{
gs_slide_df(id)

notes_from_slide(id)
}
\arguments{
\item{id}{Slide id passed to \code{\link{get_slides_properties}} after passing
through \code{\link{as_id}}}
}
\value{
A \code{data.frame} of the identifiers and properties of the
slides
}
\description{
Get Google Slide Elements IDs
}
\examples{
\dontrun{
id = "1XoRj0pwaLI34XKZ7TljVeDHu-tbgGmXRmQa528JIwmw"
all_notes = notes_from_slide(id)
slides = gs_slide_df(id)
slides$slideProperties$notesPage$pageElements[[1]]
pe = slides$slideProperties$notesPage$pageElements
text = pe[[1]]$shape$text$textElements[[2]]$textRun$content
notes = sapply(pe,
function(r) {
res = sapply(r$shape$text$textElements, function(x) x$textRun$content)
res = unlist(res)
res = res[!is.na(res)]
if (is.null(res)) {
res = ""
}
paste(res, collapse = " ")
})
notes
}
}