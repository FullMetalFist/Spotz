//
//  CircleImage.swift
//  Spotz
//
//  Created by Michael Vilabrera on 9/30/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("3rdAvePlaygroundFrancisLewis"))
}
