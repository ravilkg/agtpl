var JsonDataImage = React.createClass({
  render: function () {
    var imgListLocal = [];
    var altText = this.props.imageList.make + " " + this.props.imageList.model + " " + this.props.imageList.year;
    this.props.imageList.images.forEach(function (imgList) {
      imgListLocal.push(
        <a target="_blanc" href={imgList}>
          <img src={imgList} alt={altText} />
        </a>
      )
    });
    return (
      <div class="responsive">
        <div class="img">
          {imgListLocal}
        </div>
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
        this.setState({data: data.hits.hits});
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
    var rows = [];
    var keyText = this.props.filterText;
    this.state.data.forEach(function (car) {
      if (car._source.make.indexOf(keyText) !== -1) {
        return (
          rows.push(
          <div className="borderbottom">
            <h3>
              {car._source.make}
              {car._source.model}
              {car._source.year}
            </h3>
            <JsonDataImage imageList={car._source} />
            <a href={car._source.uniq} target="_blank">Подробнее</a>
          </div>
          )
        )
      }
    });
    return (
      <div className="jsonDataCar">
      <h1>Cars</h1>
        {rows}
    </div>
    );
  }
});

var FilterableJsonData = React.createClass({
  getInitialState: function () {
    return {filterText: ''}
  },
  handleUserInput: function(filterText) {
    this.setState({filterText: filterText});
  },
  render: function () {
    return (
      <div>
        <SearchBar filterText={this.state.filterText}
                   onUserInput={this.handleUserInput}/>
        <JsonData url="/api/autos"
                  pollInterval={2000}
                  filterText={this.state.filterText}/>
      </div>
    )
  }
});

var SearchBar = React.createClass({
  handleChange: function() {
    this.props.onUserInput(
      this.refs.filterTextInput.value
    );
  },
  render: function () {
    return (
      <div className="searchForm">
        <input className="searchBar"
               type="text"
               autoFocus
               value={this.props.filterText}
               ref="filterTextInput"
               onChange={this.handleChange}/>
        <input className="goButton"
               type="submit"
               value="GO"
               onChange={this.handleChange}/>
      </div>
    )
  }
});

ReactDOM.render(
  <FilterableJsonData />,
  document.getElementById('content')
);
