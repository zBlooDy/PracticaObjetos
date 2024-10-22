class Usuario {
    const productosEnCarrito
    const cupones

    method agregarProducto(unProducto) {
        productosEnCarrito.add(unProducto)
    }

    method comprarProductos() {
        productosEnCarrito.forEach({producto => self.comprar(producto)})
    }

    method comprar(unProducto) {
        const cuponAleatorio = self.tomarCuponAleatorio()
    }

    method tomarCuponAleatorio() {
        return cupones.filter({unCupon => unCupon.libre()}).anyOne()
    }


}