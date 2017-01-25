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
      <p>{car._source.make} &nbsp;
      {car._source.model}</p>
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
  render: function() {
    return (
      <div className="jsonDataCar">
      <h1>Cars</h1>
      <JsonDataCar cars={this.props.data}/>
    </div>
    );
  }
});

ReactDOM.render(
<JsonData data={data} />,
  document.getElementById('content')
);
