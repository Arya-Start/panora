import 'package:panora/imp.dart';
import 'package:panora/models/cart.dart';
import 'package:provider/provider.dart';

class MBookDetail extends StatefulWidget {
  final Book book;
  final Function onBack;
  MBookDetail({this.book, this.onBack});

  @override
  _MBookDetailState createState() => _MBookDetailState();
}

class _MBookDetailState extends State<MBookDetail> {
  var top = 0.0;
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Cart>(context);

    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    title: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: widget.onBack),
                        Text(
                          'Book Detail',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
                    expandedHeight: 320.0,
                    floating: false,
                    iconTheme: IconThemeData(color: Colors.black),
                    pinned: true,
                    snap: false,
                    flexibleSpace: buildLayoutBuilder(orders)),
              ];
            },
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Descriptions :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.book.getBody),
                ],
              ),
            ))));
  }

  LayoutBuilder buildLayoutBuilder(Cart orders) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      top = constraints.biggest.height;
      return FlexibleSpaceBar(
          centerTitle: false,
          title: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              //opacity: top == 80.0 ? 1.0 : 0.0,
              opacity: 1.0,
              child: top == 80.0
                  ? Text(
                      '',
                      style: TextStyle(fontSize: 16.0, color: Colors.black38),
                    )
                  : Text('')),
          background: Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  child: Image.network(
                    widget.book.getImgUrl,
                    width: 120,
                    height: 180,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildBookDetailRow('Book Title', widget.book.getTitle),
                    buildBookDetailRow('Author', widget.book.getAuthor),
                    buildBookDetailRow('Page', widget.book.getPage.toString()),
                    buildBookDetailRow('Size', widget.book.getSize),
                    buildBookDetailRow('Category', widget.book.getCategory),
                    buildBookDetailRow(
                        'Price', widget.book.getPrice.toString()),
                    buildBookDetailRow(
                        'Quantity', widget.book.getPrice.toString()),
                    buildQuantityRow(),
                    buildAddToCartBtn(orders, context),
                  ],
                ))
              ],
            ),
          ));
    });
  }

  Row buildAddToCartBtn(Cart orders, BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: RaisedButton(
                color: Colors.amber[800],
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
                onPressed: () {
                  widget.book.quantity = _itemCount;

                  orders.addBook(widget.book);
                  orders.setTotalPrice(widget.book.price.toInt(), _itemCount);
                  widget.book.setSubTotal = widget.book.price * _itemCount;

                  print('Lize ${orders.getBookList.length}');
                  print(orders.getBookList.toString());

                  /////*****************///////
                  showDialog(
                    context: context,
                    builder: (context) {
                      return buildSuccessDialog(context);
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }

  AlertDialog buildSuccessDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Title'),
      content: Text('Successfully Added'),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'))
      ],
    );
  }

  Row buildQuantityRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text('Quantity'),
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              _itemCount > 1
                  ? RawMaterialButton(
                      onPressed: () => setState(() => _itemCount--),
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.remove),
                      constraints: BoxConstraints(maxWidth: 50),
                      fillColor: Colors.grey[300],
                    )
                  : RawMaterialButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.remove),
                      constraints: BoxConstraints(maxWidth: 50),
                      fillColor: Colors.grey[300],
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Text(_itemCount.toString()),
              ),
              RawMaterialButton(
                onPressed: () => setState(() => _itemCount++),
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.add),
                constraints: BoxConstraints(maxWidth: 50),
                fillColor: Colors.grey[300],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildBookDetailRow(String key, String value) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text('$key'),
          flex: 1,
        ),
        Expanded(flex: 1, child: Text('$value')),
      ],
    );
  }
}
