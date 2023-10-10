//
//  ProductCell.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import SwiftUI
import Kingfisher

struct ProductCell: View {
    
    var vm = ProductsViewModel()
    var product = ProductData()
    @State var count = 1
    
    var body: some View {
        VStack {
            productHeader
            addToCartButton
            
            Divider()
                .padding()
        }
    }
    
    
    // Product Header Contain Image, title, price
    var productHeader: some View {
        VStack {
            productImgAndPrice
            productTitleAndQuantity
        }
    }
    
    var productImgAndPrice: some View {
        ZStack(alignment:.topTrailing) {
            KFImage(URL(string: product.image) ?? URL(string: ""))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,maxHeight: 150,alignment: .top)
            
            Text("\(product.price.description) EGP")
                .font(.system(size: 12))
                .padding()
                .foregroundColor(Color.white)
                .background(Color.black)
                .padding(.top,22)
                .frame(maxWidth: 100,maxHeight: 150, alignment: .topTrailing)
        }
    }
    
    var productTitleAndQuantity: some View {
        HStack {
            Text(product.description)
                .font(.system(size: 12))
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom,4)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            addQuantity
        }
    }
    
    
    var addQuantity: some View {
        HStack {
            
            Button {
                increaseCounter()
            } label: {
                customQuantityButton(imageName: "plus")
            }
            
            Text(count.description)
                .frame(width: 25,height: 25)
            
            
            Button {
                decreaseCounter()
            } label: {
                customQuantityButton(imageName: "minus")
            }
            
        }
        .padding(.trailing,22)
        .frame(maxWidth: .infinity,alignment: .trailing)
        
    }
    
    
    var addToCartButton: some View {
        HStack(alignment: .center) {
            Button {
                vm.addToCart(product: product)
            } label: {
                addCartView
            }
        }
        .padding()
        .background(customBlackStroke(width: 120, height: 30))
        .frame(width: 120,height: 40)
        
    }
    
    
    var addCartView: some View {
        HStack{
            
            Text("Add To Cart")
                .font(.system(size: 12))
                .foregroundColor(Color.black)
            
            
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.black)
                .frame(width: 8,height: 8)
        }
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
    
    
    func increaseCounter(){
        count += 1
    }
    
    func decreaseCounter(){
        if count != 1 {
            count -= 1
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell()
            .previewLayout(.sizeThatFits)
    }
}
