//
//  SettingsHeaderView.swift
//  WaterTrackerApp
//
//  Created by Monica Vargas on 2022-12-06.
//

import SwiftUI

struct SettingsHeaderView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
          Text(labelText.uppercased()).fontWeight(.bold)
          Spacer()
          Image(systemName: labelImage)
        }
    }
}

struct SettingsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHeaderView(labelText: "", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
