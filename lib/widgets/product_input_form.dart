import 'package:flutter/material.dart';

class ProductInputForm extends StatefulWidget { // [cite: 31]
  const ProductInputForm({super.key});

  @override
  State<ProductInputForm> createState() => _ProductInputFormState();
}

class _ProductInputFormState extends State<ProductInputForm> {
  double discount = 0;
  bool inStock = true;
  String category = 'Laptop';
  String selectedDate = 'Chưa chọn';

  Future<void> _selectDate(BuildContext context) async { // [cite: 33]
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => selectedDate = "${picked.day}/${picked.month}/${picked.year}"); // [cite: 57]
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Slider điều chỉnh phần trăm giảm giá [cite: 32]
        Row(
          children: [
            const Text('Giảm giá:'),
            Expanded(
              child: Slider(
                value: discount,
                min: 0,
                max: 50,
                divisions: 10,
                label: '${discount.toInt()}%',
                onChanged: (val) => setState(() => discount = val), // [cite: 57]
              ),
            ),
            Text('${discount.toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold)), // [cite: 34]
          ],
        ),
        // 2. Switch trạng thái kho hàng [cite: 32]
        SwitchListTile(
          title: const Text('Còn hàng (In Stock)'),
          value: inStock,
          onChanged: (val) => setState(() => inStock = val), // [cite: 57]
        ),
        // 3. Radio Buttons danh mục [cite: 32]
        const Text('Danh mục:', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Laptop'),
                value: 'Laptop',
                groupValue: category,
                onChanged: (val) => setState(() => category = val!), // [cite: 57]
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Mobile'),
                value: 'Mobile',
                groupValue: category,
                onChanged: (val) => setState(() => category = val!), // [cite: 57]
              ),
            ),
          ],
        ),
        // 4. Date Picker chọn ngày nhập kho [cite: 33]
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.calendar_month),
              label: const Text('Chọn ngày nhập'),
              onPressed: () => _selectDate(context), // [cite: 58]
            ),
            Text('Ngày: $selectedDate', style: const TextStyle(color: Colors.blueAccent)), // [cite: 34]
          ],
        ),
      ],
    );
  }
}