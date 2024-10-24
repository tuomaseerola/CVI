CVI_visualise <- function(data,yvar='CVI.I.adj',colorvar='KappaFit') {
# visualise items
  data2 <- dplyr::select(data,all_of(c('Item',yvar,colorvar)))
  names(data2) <- c('Item','CVI','Goodness')
  g1<-ggplot2::ggplot(data2,ggplot2::aes(
    x=reorder(Item,CVI),
    y=CVI,
    color=Goodness,
    group=Goodness)) +
    ggplot2::geom_point()+
    ggplot2::geom_line()+
    ggplot2::coord_flip()+
    ggplot2::xlab('Items')+
    ggplot2::ylab(yvar)+
    ggplot2::scale_color_brewer(palette = "Spectral",direction=-1,name=colorvar)+
    ggplot2::theme_bw()
    print(g1)  
    return <- g1
}
