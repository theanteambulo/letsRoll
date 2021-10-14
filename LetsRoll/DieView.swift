//
//  DieView.swift
//  LetsRoll
//
//  Created by Jake King on 06/10/2021.
//

import SwiftUI

struct DieView: View {
    var valueRolled: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10,
                             style: .continuous)
                            .fill(Color.white)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 3)
            
            Text("\(valueRolled)")
                .font(.largeTitle.bold())
                .foregroundColor(Color.black)
        }
    }
}

struct DieView_Previews: PreviewProvider {
    static var previews: some View {
        DieView(valueRolled: 4)
    }
}

