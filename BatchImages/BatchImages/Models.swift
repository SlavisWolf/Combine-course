//
//  Model.swift
//  BatchImages
//
//  Created by Antonio Jesús on 11/10/23.
//

import Foundation
import SwiftUI

struct ImagesData {
    
    let urls = [
        URL(string: "https://assetsio.reedpopcdn.com/Spider-Man-PC-Anforderungen-und-Features-best%C3%A4tigt.jpg?width=1200&height=1200&fit=bounds&quality=70&format=jpg&auto=webp"),
        URL(string: "https://estaticos-cdn.epe.es/clip/1e82da58-9041-4917-ba37-232ed52ee081_alta-libre-aspect-ratio_default_0.jpg"),
        URL(string: "https://img2.rtve.es/imagenes/thor/1585840424188.jpg"),
        URL(string: "https://hips.hearstapps.com/hmg-prod/images/hulk-thor-ragnarok-2-1548346471.jpg?crop=0.670xw:1.00xh;0.0718xw,0&resize=1200:*"),
        URL(string: "https://lumiere-a.akamaihd.net/v1/images/pp_guardiansofthegalaxy_herobanner_mobile_21001_560ae126.jpeg?region=0,0,640,480"),
        URL(string: "https://www.akiracomics.com/imagenes/poridentidad?identidad=737b7397-851b-4e59-a3b5-959cacd9e80b&ancho=850&alto="),
        URL(string: "https://hips.hearstapps.com/digitalspyuk.cdnds.net/14/11/movies-captain-america-the-winter-soldier-chris-evans.jpg?resize=980:*"),
        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSYy-dthItw1dxbzKMR0UZXJ6_HqmBXEqRaQ&usqp=CAU"),
        URL(string: "https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/01/doctor_strange_en_el_multiverso_de_la_locura_sam_raimi_4.jpg?fit=1200%2C800&quality=50&strip=all&ssl=1"),
        URL(string: "https://img.europapress.es/fotoweb/fotonoticia_20180208185701_1200.jpg"),
        URL(string: "https://cloudfront-eu-central-1.images.arcpublishing.com/prisaradiolos40/YTKAWCSOC5MSFMPI7F4ORMB7GA.jpg"),
        URL(string: "https://hips.hearstapps.com/hmg-prod/images/she-hulk-attorney-at-law-tatiana-maslany-1665664059.jpg"),
        URL(string: "https://hips.hearstapps.com/hmg-prod/images/brie-larson-captain-marvel-1567069037.jpg?crop=0.527xw:1.00xh;0.349xw,0&resize=640:*"),
        URL(string: "https://i.blogs.es/153ea7/black-panther/1366_2000.jpg"),
        URL(string: "https://hips.hearstapps.com/hmg-prod/images/deadpool-3-estreno-trailer-argumento-1583943406.jpg?crop=0.6665371916877063xw:1xh;center,top&resize=1200:*"),
        URL(string: "https://estaticos-cdn.prensaiberica.es/clip/2f1a1df5-9387-4e8c-b2bb-35d14d86ca4b_16-9-aspect-ratio_default_0.jpg"),
        URL(string: "https://www.ed92.org/wp-content/uploads/2022/10/1000000000000500000002D0205DB1F1.jpg"),
        URL(string: "https://sm.ign.com/ign_latam/news/e/elizabeth-/elizabeth-olsen-is-getting-tired-of-just-being-known-as-the_8271.jpg"),
        URL(string: "https://static.wikia.nocookie.net/marvelmovies/images/d/dc/Pietro_Poster_Cropped.jpg/revision/latest?cb=20150322163732"),
        URL(string: "https://img.europapress.es/fotoweb/fotonoticia_20150503120949_1200.jpg"),
        URL(string: "https://static.wikia.nocookie.net/marvelcinematicuniverse/images/1/18/Moon_Knight_-_Promocional_Empire_Textless.png/revision/latest?cb=20220409172753&path-prefix=es"),
        URL(string: "https://pm1.aminoapps.com/6198/ca940a5dfdef1983e7b8adb5c7f7bf676f18c827_00.jpg")
    ].compactMap {$0}
    
}

struct PhotoModel: Identifiable {
    let id = UUID()
    let image: Image
}
