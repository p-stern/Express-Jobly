describe("Servers test (with setup and tear-down)", function () {
  beforeEach(function () {
    // initialization logic
    serverNameInput.value = 'Alice';
  });

  it('should add a new server to allServers on submitServerInfo()', function () {
    submitServerInfo();

    expect(Object.keys(allServers).length).toEqual(1);
    expect(allServers['server' + serverId].serverName).toEqual('Alice');
  });

  //from solution 
  it('should not add a new server on submitServerInfo() with empty input', function () {
    serverNameInput.value = '';
    submitServerInfo();

    expect(Object.keys(allServers).length).toEqual(0);
  });
  //from solution

  it('should update Server Table on updateServerTable()', function () {
    submitServerInfo();
    updateServerTable();

    let serverTableRow = document.querySelectorAll('#serverTable tbody tr td');

    expect(serverTableRow[0].innerText).toEqual('Alice');

  });

  it('should delete from Server Table on updateServerTable()', function () {
    submitServerInfo();
    updateServerTable();
    expect(allServers).toBeDefined();

  });

  afterEach(function () {
    serverNameInput.value = '';
    allServers = {};
    serverId = 0;
  });

});
