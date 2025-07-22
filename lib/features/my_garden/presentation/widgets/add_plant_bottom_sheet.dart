import 'dart:io';
import 'package:app_plant_doctor_ai/features/my_garden/domain/entities/plant_garden.dart';
import 'package:app_plant_doctor_ai/shared_widgets/plant_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_plant_doctor_ai/features/my_garden/data/models/plant_model.dart';

class AddPlantBottomSheet extends StatelessWidget {
  const AddPlantBottomSheet({super.key});

  Future<void> _handleCameraAccess(BuildContext context) async {
    final cameraStatus = await Permission.camera.request();

    if (cameraStatus.isGranted) {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        // Lưu ảnh vào thư mục app
        final directory = await getApplicationDocumentsDirectory();
        final filename = 'plant_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final savedImagePath = '${directory.path}/$filename';
        await File(image.path).copy(savedImagePath);

        // Gọi dialog để người dùng nhập name + type
        _showInputDialog(context, savedImagePath);
      }
    } else if (cameraStatus.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Không được cấp quyền camera")),
      );
    } else if (cameraStatus.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Camera bị từ chối vĩnh viễn"),
          action: SnackBarAction(
            label: "Cài đặt",
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
  }

  void _showInputDialog(BuildContext context, String imagePath) {
    final nameController = TextEditingController();
    final typeController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Thông tin cây trồng'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Tên cây'),
                ),
                TextField(
                  controller: typeController,
                  decoration: const InputDecoration(labelText: 'Loại'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // cancel
                child: const Text('Hủy'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final name = nameController.text.trim();
                  final type = typeController.text.trim();

                  if (name.isEmpty || type.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Vui lòng điền đầy đủ thông tin'),
                      ),
                    );
                    return;
                  }

                  final newPlant = PlantModel(
                    id: DateTime.now().millisecondsSinceEpoch,
                    name: name,
                    type: type,
                    imageUrl: imagePath,
                  );

                  await PlantStorage.addPlant(newPlant);

                  Navigator.pop(context); // đóng dialog
                  Navigator.pop(context); // đóng bottom sheet

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đã thêm cây mới")),
                  );
                },
                child: const Text('Lưu'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Text(
            'Add Plant',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Identify by photo'),
            onTap: () => _handleCameraAccess(context),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search by name'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/searchPlant');
            },
          ),
        ],
      ),
    );
  }
}
