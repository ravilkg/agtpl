var JsonDataImage = React.createClass({
  render: function () {
    var imgListLocal = [];
    this.props.imageList.forEach(function (imgList) {
      imgListLocal.push(<img src={imgList} />)
    });
    return (
      <div className="jsonDataImage">
      {imgListLocal}
      </div>
    )
  }
});

var JsonDataCar = React.createClass({
  render: function () {
    var carData = this.props.cars.hits.hits.map(function (car) {
      return (
        <div>
        {car._id}
      <JsonDataImage imageList={car._source.images}/>
      </div>
      )
    });
    return (
      <div className="jsonDataCar">
      {carData}
      </div>
    )
  }
});

var JsonData = React.createClass({
  loadAutosFromServer: function () {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function (data) {
        this.setState({data: data});
      }.bind(this),
      error: function (xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function () {
    return {data: []};
  },
  componentDidMount: function () {
    this.loadAutosFromServer();
    setInterval(this.loadAutosFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="jsonDataCar">
      <h1>Cars</h1>
      <JsonDataCar cars={this.state.data}/>
    </div>
    );
  }
});

ReactDOM.render(
<JsonData url="/api/autos" pollInterval={2000} />,
  document.getElementById('content')
);
