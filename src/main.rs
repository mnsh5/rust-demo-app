use actix_web::{get, web, App, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Pizzas from Buenos Aires!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new().service(web::scope("/api/v1").service(hello))

        // .route("/api/v1", web::get().to(get_pizzas))
    })
    .bind(("127.0.0.1", 8000))?
    .run()
    .await
}
