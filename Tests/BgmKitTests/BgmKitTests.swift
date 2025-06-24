import Testing

@testable import BgmKit

let client = BgmClient(
        configuration: BgmClient.Configuration(url: "test", device: "test"),
        accessToken: "rBMNJCYySHvBtV25JtfWu0446uMeKFvxcTb2hwIb")

@Test func calendar() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let request = BgmKit.Paths.calendarAPI
    let response = try await client.send(request)

    #expect(response.statusCode == 200, "success")
    print(response.value[0].items?[0])
}

@Test func getSubjectByID() async throws {
    let request = BgmKit.Paths.getSubjectByIDAPI(subjectID: 10)
    let response = try await client.send(request)
    #expect(response.statusCode == 200, "success")
    print(response.value)
    print(response.data.description)
}

@Test func getSubjectPersons() async throws {
    let request = BgmKit.Paths.getSubjectPersonsAPI(subjectID: 526816)
    let response = try await client.send(request)
    #expect(response.statusCode == 200, "success")
    print(response.value)
    print(response.data.description)
}

@Test func getSelfInfo() async throws {
    let request = BgmKit.Paths.getSelfInfoAPI()
    let response = try await client.send(request)
    #expect(response.statusCode == 200, "success")
    #expect(response.value.id == 876475, "id check")
    print(response.value)
}
