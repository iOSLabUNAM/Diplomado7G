//
//  HyruleItemRowView.swift
//  BOTW
//
//  Created by Luis Ezcurdia on 15/07/23.
//

import SwiftUI

struct HyruleItemRowView: View {
    let item: Item
    var body: some View {
            HStack {
                Image(systemName: "leaf")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .padding()
                VStack(alignment: .leading) {
                    HStack{
                        Text(item.name.capitalized)
                            .font(.headline)
                        Spacer()
                        if item.edible {
                            Image(systemName: "heart.fill")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                        if item.dlc {
                            Image(systemName: "shippingbox")
                                    .font(.headline)
                                    .foregroundColor(.yellow)
                        }
                        Text(item.category)
                            .font(.subheadline)
                    }
                    Text(item.description.prefix(64) + "...")
                        .font(.system(size: 14, weight: .light))
                        .padding(.top, 3)
                }
            }
    }
}

struct HyruleItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        HyruleItemRowView(
            item: Item(
                id: 124,
                name: "rainbow sparrow",
                description:"These small birds hail from the Faron region. As the name suggests, their feathers are more colorful than other sparrows', which has made them a favorite among dilettantes. They feed on small rain-forest insects, but the omnivore in them loves nuts as well.",
                category: "creatures",
                imageUrlString: "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/rainbow_sparrow/image",
                commonLocations: ["Faron Grasslands", "West Necluda", "Floria Bridge"],
                drops: ["chickaloo tree nut"],
                dlc: false,
                edible: false
            )
        )
    }
}
