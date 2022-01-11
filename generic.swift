import Foundation

/* 
  Generic
*/


// The Problem That Generic Solve
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// > someInt is now 107, and anotherInt is now 3

func swapTwoStrings(_ a: inout String, _ b: inout String) {
  let temporaryA = a
  a = b
  b = temporaryA
}

/*
  As you can see, function `swapTwoInts` and `swapTwoStrings is only difference is the parameter type that they are accept(Int, String)`
*/


/* 
  Generic function 
  - <T> => T is a placeholder type name.
  - the type to use for T is inferred from `the types of values passed to the function`
*/

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt1 = 3
var anotherInt1 = 107
swapTwoValues(&someInt, &anotherInt1) // someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString) // someString is now "world", and anotherString is now "hello"


/* 
  Type constraints 
  - Sometime you would like to specific type parameter must be only this type or type that inherit from specific class, or conform to particular protocol.
*/

enum APIProtocol: String {
  case Http = "http"
  case Https = "https"
}
enum APIHttpMethod: String {
  case Get = "GET"
  case Post = "POST"
  case Put = "PUT"
  case Patch = "PATCH"
  case Delete = "DELETE"
}
enum APIHttpContentType: String {
  case Json = "application/json"
  case Xml = "application/xml"
}
protocol BaseAPI {
  var httpProtocol: APIProtocol {get}
  var host: String {get set}
  var endpoint: String {get set}
  var httpMethod: APIHttpMethod {get}
  var contentType: APIHttpContentType {get set}
  var body: String? {get set}
}


struct GetProfileRequest: BaseAPI {
    var httpProtocol: APIProtocol = .Http
    var host: String = "example.com"
    var endpoint: String = "/api/v1/profile"
    var httpMethod: APIHttpMethod = .Get
    var contentType: APIHttpContentType = .Json
    var body: String? = nil
}

struct CreateSourceRequest: BaseAPI {
    var httpProtocol: APIProtocol = .Https
    var host: String = "hello.example.com"
    var endpoint: String = "/api/v1/source"
    var httpMethod: APIHttpMethod = .Post
    var contentType: APIHttpContentType = .Json
    var body: String? = """
            {
                "field_1":"field_1_val",
                "field_2":"field_2_val",
                "field_3":"field_3_val",
            }
            """
}

class HttpClient<T: BaseAPI> {
    let reqBuilder: T
    
    init(reqBuilder: T){
        self.reqBuilder = reqBuilder
    }
    
    func Do(){
        let api = "\(reqBuilder.httpProtocol.rawValue)://\(reqBuilder.host)"
        print("url: \(api + reqBuilder.endpoint)")
        print("http_method: \(reqBuilder.httpMethod.rawValue)")
        print("content-type: \(reqBuilder.contentType.rawValue)")
        if let body = reqBuilder.body {
            print("body: \(body)")
        }
    }
}

let getProfileReq = HttpClient(reqBuilder: GetProfileRequest())
getProfileReq.Do()
// > url: http://example.com/api/v1/profile
// > http_method: GET
// > content-type: application/json
let createSourceReq = HttpClient(reqBuilder: CreateSourceRequest())
createSourceReq.Do()
// > url: https://hello.example.com/api/v1/source
// > http_method: POST
// > content-type: application/json
/*
body: {
    "field_1":"field_1_val",
    "field_2":"field_2_val",
    "field_3":"field_3_val",
}
*/