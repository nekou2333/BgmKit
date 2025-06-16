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
