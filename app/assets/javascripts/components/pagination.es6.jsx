class Pagination extends React.Component {
  constructor(props) {
    super(props);
    this.MAX_PAGE_LINKS = 11;
  }

  goToFirstPage() {
    this.props.fetchData(1);
  }

  goToLastPage() {
    this.props.fetchData(this.props.totalPages);
  }

  goToPage(event) {
    this.props.fetchData(event.target.innerHTML);
  }

  render () {
    if(this.props.totalPages === 1) {
      return null;
    }
    var pageLinks = [];

    pageLinks.push(
      <li key="first">
        <a onClick={this.goToFirstPage.bind(this)} style={ {cursor: "pointer"} }>First</a>
      </li>
    );

    var lowestPageLink = 1,
        highestPageLink = 1;

    if (this.props.totalPages < this.MAX_PAGE_LINKS) {
      lowestPageLink = 1;
      highestPageLink = this.props.totalPages;
    } else if (this.props.currentPage <= Math.floor(this.MAX_PAGE_LINKS / 2)) {
      lowestPageLink = 1;
      highestPageLink = this.MAX_PAGE_LINKS;
    } else if (this.props.currentPage >= this.props.totalPages - Math.floor(this.MAX_PAGE_LINKS / 2)) {
      lowestPageLink = this.props.totalPages - this.MAX_PAGE_LINKS;
      highestPageLink = this.props.totalPages;
    } else {
      lowestPageLink = this.props.currentPage - Math.floor(this.MAX_PAGE_LINKS / 2);
      highestPageLink = lowestPageLink + this.MAX_PAGE_LINKS;
    }

    for (var page = lowestPageLink, classes = ""; page <= highestPageLink; page++, classes = "") {
      if (page === this.props.currentPage) {
        classes = "active";
      }
      pageLinks.push(
        <li className={classes} key={page}>
          <a onClick={this.goToPage.bind(this)} style={ {cursor: "pointer"} } >{page}</a>
        </li>
      );
    }

    pageLinks.push(
      <li key="last">
        <a onClick={this.goToLastPage.bind(this)} style={ {cursor: "pointer"} }>Last</a>
      </li>
    );

    return (
      <nav style={{textAlign: 'center'}}>
        <ul className="pagination">
          {pageLinks}
        </ul>
      </nav>
    );
  }
}
