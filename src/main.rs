mod db;

#[macro_use]
extern crate rocket;

#[get("/")]
async fn index() -> &'static str {
    "Hello, world!"
}

#[launch]
async fn rocket() -> _ {
    rocket::build()
        .manage(db::database::establish_connection)
        .mount("/api/v1", routes![index])
}
