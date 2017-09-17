class WarningBanner extends React.Component {
  render () {
    if(this.props.message === '') {
      return null;
    }
    return (
      <div className="alert alert-danger" style={{textAlign: 'center'}}>
        Warning!  {this.props.message}
      </div>
    );
  }
}
