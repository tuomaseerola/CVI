#' Creates a plot of the CVI per items
#'
#' Assumes item CVIs have been calculated previously
#'
#' @param data items as data frame
#' @param yvar which variable to plot on the Y-axis
#' @param colorvar which variable to plot as the colour
#' @param showlegend option to show legend (false is the default)
#' @return data frame with the same structure as the input

CVI_visualise <- function(data,yvar='CVI.I.adj',colorvar='KappaFit',showlegend=FALSE) {
# visualise items
  data2 <- dplyr::select(data,all_of(c('Item',yvar,colorvar)))
  names(data2) <- c('Item','CVI','Goodness')
  g1<-ggplot2::ggplot(data2,ggplot2::aes(
    x=reorder(Item,CVI),
    y=CVI,
    fill=Goodness,
    group=Goodness)) +
#    ggplot2::geom_point()+
#    ggplot2::geom_line()+
    ggplot2::geom_col(show.legend = showlegend,color='black')+
    ggplot2::coord_flip()+
    ggplot2::xlab('Items')+
    ggplot2::ylab(yvar)+
    ggplot2::scale_y_continuous(limits=c(0,1),expand = c(0.001,0.001))+
    ggplot2::scale_fill_brewer(palette = "Accent",direction=1,name=colorvar)+
    ggplot2::theme_bw()+
    ggplot2::theme(legend.position = "inside", legend.position.inside = c(0.7, 0.2))
      #print(g1)
    return <- g1
}
