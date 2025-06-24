import Testing

@testable import BgmKit

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let client = BgmClient(
        configuration: BgmClient.Configuration(url: "test", device: "test"),
        accessToken: "rBMNJCYySHvBtV25JtfWu0446uMeKFvxcTb2hwIb")

    let request = BgmKit.Paths.calendarAPI
    let response = try await client.send(request)

    #expect(response.statusCode == 200, "success")
    print(response.value[0].items?[0])
}

@Test func getSubjectByID() async throws {
    let client = BgmClient(
        configuration: BgmClient.Configuration(url: "test", device: "test"),
        accessToken: "rBMNJCYySHvBtV25JtfWu0446uMeKFvxcTb2hwIb")
    let request = BgmKit.Paths.getSubjectByIDAPI(subjectID: 10)
    let response = try await client.send(request)
    #expect(response.statusCode == 200, "success")
    print(response.value)
    print(response.data.description)
}

@Test func getSubjectPersons() async throws {
    let client = BgmClient(
        configuration: BgmClient.Configuration(url: "test", device: "test"),
        accessToken: "rBMNJCYySHvBtV25JtfWu0446uMeKFvxcTb2hwIb")
    let request = BgmKit.Paths.getSubjectPersonsAPI(subjectID: 526816)
    let response = try await client.send(request)
    #expect(response.statusCode == 200, "success")
    print(response.value)
    print(response.data.description)
}

@Test func getSelfInfo() async throws {
    let client = BgmClient(
        configuration: BgmClient.Configuration(url: "test", device: "test"),
        accessToken: "rBMNJCYySHvBtV25JtfWu0446uMeKFvxcTb2hwIb")
    let request = BgmKit.Paths.getSelfInfoAPI()
    let response = try await client.send(request)
    #expect(response.statusCode == 200, "success")
    #expect(response.value.id == 876475, "id check")
    print(response.value)
}
