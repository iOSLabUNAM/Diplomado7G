//
//  HyruleItemListView.swift
//  BOTW
//
//  Created by Luis Ezcurdia on 15/07/23.
//

import SwiftUI

struct HyruleItemListView: View {
    var items: [Item] = []
    var body: some View {
        NavigationView {
            List(items) { item in
                HyruleItemRowView(item: item)
            }
            .listStyle(.plain)
            .navigationTitle("BOTW")
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        HyruleItemListView(items: [
            Item(
                id: 124,
                name: "rainbow sparrow",
                description:"These small birds hail from the Faron region. As the name suggests, their feathers are more colorful than other sparrows', which has made them a favorite among dilettantes. They feed on small rain-forest insects, but the omnivore in them loves nuts as well.",
                category: "creatures",
                imageUrlString: "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/rainbow_sparrow/image",
                commonLocations: ["Faron Grasslands", "West Necluda", "Floria Bridge"],
                drops: ["chickaloo tree nut"],
                dlc: true,
                edible: false
            )
        ])
    }
}
