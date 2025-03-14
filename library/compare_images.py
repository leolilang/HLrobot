from skimage.metrics import structural_similarity as ssim
from PIL import Image
import numpy as np


def compare_images(image_path_1, image_path_2, threshold=0.9):
    """
    比较两张图片是否匹配，通过设置相似度阈值判断

    参数:
    image_path_1 (str): 第一张图片的路径
    image_path_2 (str): 第二张图片的路径
    threshold (float): 相似度阈值，取值范围0到1，默认值为0.9

    返回:
    bool: 如果相似度大于等于阈值则返回True，表示图片匹配；否则返回False
    """
    # 加载实际截图和预期图片
    screenshot = Image.open(image_path_1)
    expected_image = Image.open(image_path_2)

    # 如果截图和预期图片大小不同，则调整截图的大小
    if screenshot.size != expected_image.size:
        screenshot = screenshot.resize(expected_image.size)

    # 将图片转换为灰度图，以便计算 SSIM
    screenshot_gray = np.array(screenshot.convert('L'))
    expected_image_gray = np.array(expected_image.convert('L'))

    # 计算 SSIM（结构相似性指数）
    score, _ = ssim(screenshot_gray, expected_image_gray, full=True)

    print(f"图像相似度（SSIM）: {score:.4f}")

    # 判断相似度是否达到阈值
    if score >= threshold:  # 可以根据需要调整阈值
        print("截图与预期图像匹配度高，测试通过。")
        return True
    else:
        print("截图与预期图像匹配度低，测试失败。")
        return False

# 示例用法
# image1_path = "C:\\Users\\lilang\\Desktop\\helix\\图片\\直播001.png"
# image2_path = "C:\\Users\\lilang\\Desktop\\helix\\图片\\直播002.png"
# threshold_value = 1  # 这里可以根据实际需求调整阈值
# result = compare_images(image1_path, image2_path, threshold_value)
# if result:
#     print("两张图片匹配")
# else:
#     print("两张图片不匹配")