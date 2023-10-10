//
//  CartCell.swift
//  One Order
//
//  Created by younan on 11/10/2023.
//

import SwiftUI
import Kingfisher

struct CartCell: View {
    var product = ProductData()
    
    var body: some View {
        VStack {
            productHeader
            
            Divider()
                .padding()
        }
    }
    
    
    // Product Header Contain Image, title, price
    var productHeader: some View {
        HStack {
            productImgAndPrice
            productTitleAndQuantity
        }
    }
    
    var productImgAndPrice: some View {
        ZStack(alignment:.topTrailing) {
            KFImage(URL(string: product.image) ?? URL(string:""))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,maxHeight: 150,alignment: .top)
        }
    }
    
    var productTitleAndQuantity: some View {
        VStack {
            Text(product.description)
                .font(.system(size: 12))
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom,4)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            priceAndaddQuantity
        }
    }
    
    
    var priceAndaddQuantity: some View {
        HStack {
            
            Text("\(product.price.description) EGP")
                .foregroundColor(Color.black)
                .padding(.leading)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            Text("\(product.quantity ?? 0 )")
                .padding(.trailing)
                .frame(width: 25,height: 25)
        }
        .frame(maxWidth: .infinity,alignment: .trailing)
    }
    
    
    func customQuantityButton(imageName: String) -> some View {
        ZStack {
            Image(systemName: imageName)
                .foregroundColor(Color.black)
                .background(customBlackStroke(width: 25, height: 25))
                .frame(width: 25, height: 25)
        }
    }
    
    func customBlackStroke(width: Int,height: Int) -> some View {
        ZStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .frame(width: CGFloat(width), height: CGFloat(height))
        }
    }
    
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        CartCell()
    }
}
